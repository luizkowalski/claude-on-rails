#!/usr/bin/env ruby
# ClaudeOnRails Installer

require 'fileutils'
require 'yaml'
require 'pathname'

class ClaudeOnRailsInstaller
  CLAUDE_CONFIG_DIR = File.expand_path('~/.claude')
  CLAUDE_ON_RAILS_DIR = File.join(CLAUDE_CONFIG_DIR, 'claude-on-rails')
  
  def self.run
    new.install
  end
  
  def install
    puts "🚂 Installing ClaudeOnRails..."
    
    check_prerequisites
    create_directories
    copy_configuration_files
    setup_claude_md
    setup_mcp_integration
    
    puts "\n✅ ClaudeOnRails installed successfully!"
    puts "\n📖 Next steps:"
    puts "1. Install Rails MCP Server (recommended):"
    puts "   gem install rails-mcp-server"
    puts "   rails-mcp-server-download-resources rails"
    puts "\n2. Configure Claude Code:"
    puts "   claude code --config #{File.join(CLAUDE_CONFIG_DIR, 'CLAUDE.md')}"
    puts "\n3. Start using ClaudeOnRails:"
    puts "   claude '/rails generate model User --persona-rails-architect'"
    puts "\n📚 Documentation: https://github.com/obie/claude-on-rails"
  end
  
  private
  
  def check_prerequisites
    unless system('which claude', out: File::NULL, err: File::NULL)
      puts "❌ Claude Code not found. Please install it first:"
      puts "   https://github.com/anthropics/claude-code"
      exit 1
    end
    
    puts "✓ Claude Code detected"
  end
  
  def create_directories
    FileUtils.mkdir_p(CLAUDE_CONFIG_DIR)
    FileUtils.mkdir_p(CLAUDE_ON_RAILS_DIR)
    
    puts "✓ Created configuration directories"
  end
  
  def copy_configuration_files
    source_dir = File.expand_path('.claude-on-rails', __dir__)
    
    if File.exist?(source_dir)
      FileUtils.cp_r(source_dir, CLAUDE_CONFIG_DIR)
      puts "✓ Copied configuration files"
    else
      puts "❌ Configuration files not found. Please run from ClaudeOnRails directory."
      exit 1
    end
  end
  
  def setup_claude_md
    claude_md_path = File.join(CLAUDE_CONFIG_DIR, 'CLAUDE.md')
    
    if File.exist?(claude_md_path)
      puts "\n⚠️  CLAUDE.md already exists"
      print "Do you want to (b)ackup and replace, (m)erge, or (s)kip? [b/m/s]: "
      
      case gets.chomp.downcase
      when 'b'
        backup_path = "#{claude_md_path}.backup.#{Time.now.strftime('%Y%m%d%H%M%S')}"
        FileUtils.mv(claude_md_path, backup_path)
        puts "✓ Backed up existing CLAUDE.md to #{backup_path}"
        copy_claude_md
      when 'm'
        merge_claude_md(claude_md_path)
      when 's'
        puts "✓ Skipped CLAUDE.md setup"
      else
        puts "❌ Invalid option"
        exit 1
      end
    else
      copy_claude_md
    end
  end
  
  def copy_claude_md
    source = File.expand_path('CLAUDE.md', __dir__)
    destination = File.join(CLAUDE_CONFIG_DIR, 'CLAUDE.md')
    
    FileUtils.cp(source, destination)
    puts "✓ Created CLAUDE.md configuration"
  end
  
  def merge_claude_md(existing_path)
    # Simple merge: append ClaudeOnRails configuration
    claude_on_rails_config = <<~CONFIG
    
    # ===== ClaudeOnRails Configuration =====
    @include claude-on-rails/shared/claude-on-rails-core.yml
    @include claude-on-rails/shared/claude-on-rails-personas.yml
    @include claude-on-rails/shared/claude-on-rails-patterns.yml
    @include claude-on-rails/shared/claude-on-rails-conventions.yml
    
    # ClaudeOnRails Commands
    @include claude-on-rails/commands/rails/generate.md
    @include claude-on-rails/commands/rails/migrate.md
    @include claude-on-rails/commands/rails/console.md
    @include claude-on-rails/commands/rails/routes.md
    # ===== End ClaudeOnRails Configuration =====
    CONFIG
    
    File.open(existing_path, 'a') do |file|
      file.puts claude_on_rails_config
    end
    
    puts "✓ Merged ClaudeOnRails configuration into existing CLAUDE.md"
  end
  
  def setup_mcp_integration
    puts "\n🔌 MCP Integration Setup"
    
    if system('which rails-mcp-server', out: File::NULL, err: File::NULL)
      puts "✓ Rails MCP Server detected"
      
      print "Download Rails documentation now? [y/n]: "
      if gets.chomp.downcase == 'y'
        system('rails-mcp-server-download-resources rails')
        puts "✓ Rails documentation downloaded"
      end
    else
      puts "ℹ️  Rails MCP Server not installed (optional but recommended)"
      puts "   Install with: gem install rails-mcp-server"
    end
  end
end

# Run installer if executed directly
if __FILE__ == $0
  ClaudeOnRailsInstaller.run
end