module ClaudeOnRails
  class ProjectAnalyzer
    attr_reader :root_path
    
    def initialize(root_path)
      @root_path = root_path
    end
    
    def analyze
      {
        api_only: api_only?,
        test_framework: detect_test_framework,
        has_graphql: has_graphql?,
        has_turbo: has_turbo?,
        has_devise: has_devise?,
        has_sidekiq: has_sidekiq?,
        javascript_framework: detect_javascript_framework,
        database: detect_database,
        deployment: detect_deployment_method,
        custom_patterns: detect_custom_patterns
      }
    end
    
    private
    
    def api_only?
      application_rb = File.join(root_path, 'config', 'application.rb')
      return false unless File.exist?(application_rb)
      
      File.read(application_rb).include?('config.api_only = true')
    end
    
    def detect_test_framework
      if File.exist?(File.join(root_path, 'spec'))
        'RSpec'
      elsif File.exist?(File.join(root_path, 'test'))
        'Minitest'
      else
        nil
      end
    end
    
    def has_graphql?
      gemfile_path = File.join(root_path, 'Gemfile')
      return false unless File.exist?(gemfile_path)
      
      gemfile_content = File.read(gemfile_path)
      gemfile_content.include?('graphql') || 
        File.exist?(File.join(root_path, 'app', 'graphql'))
    end
    
    def has_turbo?
      gemfile_path = File.join(root_path, 'Gemfile')
      return false unless File.exist?(gemfile_path)
      
      gemfile_content = File.read(gemfile_path)
      gemfile_content.include?('turbo-rails') || 
        gemfile_content.include?('stimulus-rails') ||
        File.exist?(File.join(root_path, 'app', 'javascript', 'controllers'))
    end
    
    def has_devise?
      gemfile_path = File.join(root_path, 'Gemfile')
      return false unless File.exist?(gemfile_path)
      
      File.read(gemfile_path).include?('devise')
    end
    
    def has_sidekiq?
      gemfile_path = File.join(root_path, 'Gemfile')
      return false unless File.exist?(gemfile_path)
      
      File.read(gemfile_path).include?('sidekiq')
    end
    
    def detect_javascript_framework
      package_json = File.join(root_path, 'package.json')
      return 'importmap' unless File.exist?(package_json)
      
      content = File.read(package_json)
      case
      when content.include?('webpack')
        'webpack'
      when content.include?('esbuild')
        'esbuild'
      when content.include?('vite')
        'vite'
      else
        'importmap'
      end
    end
    
    def detect_database
      database_yml = File.join(root_path, 'config', 'database.yml')
      return 'sqlite3' unless File.exist?(database_yml)
      
      content = File.read(database_yml)
      case
      when content.include?('postgresql')
        'postgresql'
      when content.include?('mysql2')
        'mysql'
      when content.include?('sqlite3')
        'sqlite3'
      else
        'unknown'
      end
    end
    
    def detect_deployment_method
      # Check for various deployment configurations
      return 'kubernetes' if File.exist?(File.join(root_path, 'k8s')) ||
                            File.exist?(File.join(root_path, 'kubernetes'))
      return 'docker' if File.exist?(File.join(root_path, 'Dockerfile'))
      return 'capistrano' if File.exist?(File.join(root_path, 'Capfile'))
      return 'heroku' if File.exist?(File.join(root_path, 'Procfile'))
      return 'kamal' if File.exist?(File.join(root_path, 'config', 'deploy.yml'))
      
      'unknown'
    end
    
    def detect_custom_patterns
      patterns = {}
      
      # Check for service objects
      if File.directory?(File.join(root_path, 'app', 'services'))
        patterns[:has_services] = true
      end
      
      # Check for form objects
      if File.directory?(File.join(root_path, 'app', 'forms'))
        patterns[:has_forms] = true
      end
      
      # Check for presenters/decorators
      if File.directory?(File.join(root_path, 'app', 'presenters')) ||
         File.directory?(File.join(root_path, 'app', 'decorators'))
        patterns[:has_presenters] = true
      end
      
      # Check for query objects
      if File.directory?(File.join(root_path, 'app', 'queries'))
        patterns[:has_queries] = true
      end
      
      # Check for policies (authorization)
      if File.directory?(File.join(root_path, 'app', 'policies'))
        patterns[:has_policies] = true
      end
      
      # Check for serializers
      if File.directory?(File.join(root_path, 'app', 'serializers'))
        patterns[:has_serializers] = true
      end
      
      patterns
    end
  end
end