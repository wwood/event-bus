Feature: Subscribe To Bus
  Background:
    Given I use a fixture named "simple_app"

  Scenario:
    Given a file named "lib/simple_app.rb" with:
    """
    require 'event/bus'
    require 'logger'

    require 'simple_app/version'
    require 'simple_app/runner'
    require 'simple_app/events'

    module SimpleApp
      @event_bus = Event::Bus.new(Event::NameResolver.new(SimpleApp::Events))
      @logger    = ::Logger.new($stderr)

      class << self
        attr_reader :event_bus, :logger

        def notify(*args, &block)
          event_bus.notify(*args, &block)
        end

        def setup
          event_bus.register Events::AppStarted, proc { logger.info 'App was started' }
        end
      end
    end
    """
    And a file named "lib/simple_app/events.rb" with:
    """
    module SimpleApp
      module Events
        # Base class
        class Event; end

        # Use when app was started by user
        class AppStarted < Event; end
      end
    end
    """
    And a file named "lib/simple_app/runner.rb" with:
    """
    require 'simple_app/events'

    module SimpleApp
      class Runner
        def initialize
          SimpleApp.setup
        end

        def start
          SimpleApp.notify Events::AppStarted.new
        end
      end
    end
    """
    And a file named "features/run.feature" with:
    """
    Feature: Run Application
      Scenario: Fire AppStarted event
        When I successfully run `simple_app`
        Then the output should contain:
        \"\"\"
        App was started
        \"\"\"
    """
    When I successfully run `cucumber`
    Then the features should all pass

