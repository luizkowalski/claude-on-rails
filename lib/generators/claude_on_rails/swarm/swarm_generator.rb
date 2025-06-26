require "rails/generators/base"
require "claude_on_rails"

module ClaudeOnRails
  module Generators
    class SwarmGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)
      
      class_option :api_only, type: :boolean, default: false,
                   desc: "Generate swarm for API-only Rails application"
      
      class_option :skip_tests, type: :boolean, default: false,
                   desc: "Skip test agent in swarm configuration"
                   
      class_option :graphql, type: :boolean, default: false,
                   desc: "Include GraphQL specialist agent"
                   
      class_option :turbo, type: :boolean, default: true,
                   desc: "Include Turbo/Stimulus specialist agents"
      
      def analyze_project
        say "Analyzing Rails project structure...", :green
        @project_analysis = ClaudeOnRails.analyze_project(Rails.root)
        
        # Auto-detect features
        @api_only = options[:api_only] || @project_analysis[:api_only]
        @has_graphql = options[:graphql] || @project_analysis[:has_graphql]
        @has_turbo = options[:turbo] && !@api_only
        @skip_tests = options[:skip_tests]
        @test_framework = @project_analysis[:test_framework]
        
        say "Project type: #{@api_only ? 'API-only' : 'Full-stack Rails'}", :cyan
        say "Test framework: #{@test_framework}", :cyan if @test_framework
        say "GraphQL detected: #{@has_graphql ? 'Yes' : 'No'}", :cyan
      end
      
      def create_swarm_config
        say "Generating swarm configuration...", :green
        template "swarm.yml.erb", "claude-swarm.yml"
      end
      
      def create_claude_md
        say "Creating CLAUDE.md configuration...", :green
        template "CLAUDE.md.erb", "CLAUDE.md"
      end
      
      def create_agent_prompts
        say "Setting up agent-specific prompts...", :green
        directory "prompts", ".claude-on-rails/prompts"
      end
      
      def update_gitignore
        say "Updating .gitignore...", :green
        append_to_file ".gitignore", "\n# ClaudeOnRails\n.claude-on-rails/sessions/\nswarm.log\n"
      end
      
      def display_next_steps
        say "\n✅ ClaudeOnRails swarm configuration created!", :green
        say "\nNext steps:", :yellow
        say "1. Review and customize claude-swarm.yml for your project"
        say "2. Start your Rails development swarm:"
        say "   claude-swarm", :cyan
        say "\nOnce the swarm is running, just describe what you want to build:"
        say '   > Add user authentication with social login', :cyan
        say "\nThe swarm will automatically coordinate the implementation across all layers!"
      end
      
      private
      
      def agents
        @agents ||= build_agent_list
      end
      
      def build_agent_list
        list = ["architect"]
        list << "models" 
        list << "controllers"
        list << "views" unless @api_only
        list << "api" if @api_only
        list << "graphql" if @has_graphql
        list << "stimulus" if @has_turbo
        list << "services"
        list << "jobs"
        list << "tests" unless @skip_tests
        list << "devops"
        list
      end
    end
  end
end