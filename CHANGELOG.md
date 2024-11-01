# Changelog

## [1.0.1] - 2024-10-30

### Changed

- Removed incorrect requirements and inputs block from [`README.md`](README.md)
- Updated release badge to 1.0.1 on [`README.md`](README.md)

## [1.0.0] - 2024-10-30

### Added
- Initial release of the EFS Monitoring module.
- Support for monitoring Elastic File Systems (EFS) with custom metric filters and alarms.
- Configurable parameters for EFS IDs, event names, and CloudWatch log settings.
- Automatic creation of CloudWatch metric filters based on specified EFS instances and their respective events.
- Alarms triggered based on defined thresholds for the specified metrics.
- Detailed variable descriptions for easy customization and configuration.

### Changed
- Updated Terraform examples in [`README.md`](README.md) to reference the module source from the Terraform Registry.
