require "claude_on_rails/version"
require "claude_on_rails/configuration"
require "claude_on_rails/project_analyzer"
require "claude_on_rails/swarm_builder"

module ClaudeOnRails
  class Error < StandardError; end
  
  class << self
    attr_accessor :configuration
    
    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
    end
    
    def configuration
      @configuration ||= Configuration.new
    end
    
    def analyze_project(root_path = Rails.root)
      ProjectAnalyzer.new(root_path).analyze
    end
    
    def build_swarm(project_analysis)
      SwarmBuilder.new(project_analysis).build
    end
  end
end