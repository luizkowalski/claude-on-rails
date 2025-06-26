# /rails generate

Purpose: Enhanced Rails generator with best practices and intelligent defaults

## Command Structure

```bash
/rails generate [type] [name] [options]
```

## Supported Types

- model
- controller
- scaffold
- migration
- service
- form
- query
- job
- api

## Core Functionality

### Immediate Mode
Generate Rails components with:
1. Best practice patterns
2. Comprehensive tests
3. Proper associations
4. Security considerations
5. Documentation

### Plan Mode (--plan)
Preview what will be generated:
1. File structure
2. Code preview
3. Test outline
4. Migration details
5. Route changes

## Universal Flags

All standard personas apply:
- `--persona-rails-architect`: Domain modeling focus
- `--persona-testing`: Comprehensive test generation
- `--persona-security`: Security best practices
- `--persona-api-designer`: API-specific patterns

## Command-Specific Flags

### Model Generation
- `--with-tests`: Generate comprehensive specs
- `--with-factory`: Create factory with traits
- `--with-policy`: Add authorization policy
- `--with-serializer`: Create API serializer
- `--skip-migration`: Skip database migration

### Controller Generation
- `--api`: API-only controller
- `--with-swagger`: Add API documentation
- `--skip-routes`: Don't modify routes
- `--parent=NAME`: Inherit from custom controller

### Service Generation
- `--async`: Generate as background job
- `--with-contract`: Add dry-validation
- `--with-tests`: Include service specs

## Examples

### Basic Model
```bash
/rails generate model User --with-tests --with-factory
```

Generates:
- User model with validations
- Database migration with indexes
- RSpec model spec
- Factory with traits
- Optional: policy, serializer

### API Controller
```bash
/rails generate controller api/v1/posts --api --persona-api-designer
```

Generates:
- API controller with versioning
- Strong parameters
- Error handling
- Serialization
- API tests
- Documentation

### Service Object
```bash
/rails generate service CreateOrder --with-tests --persona-rails-architect
```

Generates:
- Service object with call method
- Input validation
- Transaction handling
- Comprehensive tests
- Usage documentation

## Integration Points

### With MCP Servers
- Consults Rails Guides for patterns
- Checks project conventions
- References documentation

### With Testing Framework
- Detects RSpec/Minitest
- Generates appropriate tests
- Includes factories/fixtures

### With Git
- Creates feature branch
- Commits with conventional message
- Updates documentation

## Pattern Recognition

The generator analyzes:
1. Existing project patterns
2. Testing framework
3. Authentication method
4. API versioning strategy
5. Database schema

And applies consistent patterns throughout.

## Error Handling

- Validates names against Rails conventions
- Checks for conflicts
- Suggests alternatives
- Provides rollback instructions

## Best Practices Applied

1. **Models**: Proper validations, indexes, associations
2. **Controllers**: RESTful actions, strong parameters
3. **Tests**: Comprehensive coverage, edge cases
4. **Documentation**: YARD comments, README updates
5. **Security**: Authentication, authorization, parameter filtering