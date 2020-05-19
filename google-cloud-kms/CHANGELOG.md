# Release History

### 2.0.0 / 2020-05-19

#### ⚠ BREAKING CHANGES

* **kms:** Convert google-cloud-kms to a wrapper gem

#### Features

* Convert google-cloud-kms to a wrapper gem

#### Bug Fixes

* Eliminated a circular require warning.

#### Documentation

* Updated the sample timeouts in the migration guide to reflect seconds

### 1.6.0 / 2020-04-08

#### Features

* Support additional options for external protection level.

### 1.5.1 / 2020-04-01

#### Documentation

* Remove broken troubleshooting link from auth guide.

### 1.5.0 / 2020-03-11

#### Features

* Support separate project setting for quota/billing

### 1.4.1 / 2020-01-23

#### Documentation

* Update copyright year

### 1.4.0 / 2020-01-07

#### Features

* Add ProtectionLevel::EXTERNAL
  * Update documentation

### 1.3.1 / 2019-11-06

#### Bug Fixes

* Update minimum runtime dependencies

### 1.3.0 / 2019-10-29

This release require Ruby 2.4 or later.

#### Documentation

* Clarify which Google Cloud Platform products support auto-discovered credentials

### 1.2.1 / 2019-08-23

#### Performance Improvements

* Update network configuration for many RPCs to retryable

#### Documentation

* Update documentation

### 1.2.0 / 2019-07-08

* Add IAM GetPolicyOptions.
* Support overriding service host and port.

### 1.1.0 / 2019-06-17

* KeyManagementServiceClient  changes:
  * Added methods
    * create_import_job
    * get_import_job
    * list_import_jobs
    * import_crypto_key_version
  * Argument changes
    * Add filter and order_by arguments to:
      * list_key_rings
      * list_crypto_keys
      * list_crypto_key_versions
    * Add skip_initial_version_creation argument to create_crypto_key
* CryptoKeyVersion changes:
  * Add CryptoKeyVersionAlgorithm constants:
    * RSA_SIGN_PSS_4096_SHA512
    * RSA_SIGN_PKCS1_4096_SHA512
    * RSA_DECRYPT_OAEP_4096_SHA512
  * Add CryptoKeyVersionState constants:
    * PENDING_IMPORT
    * IMPORT_FAILED
* Add import_job_path helper method
* Update documentation

### 1.0.2 / 2019-06-11

* Update IAM Policy documentation.
* Add VERSION constant.

### 1.0.1 / 2019-04-29

* Update RPC retry configuration.
* Add AUTHENTICATION.md guide.
* Update documentation for common types.
* Update generated code examples.

### 1.0.0 / 2019-03-11

* Bump release level to GA.
* Support Cavium V2 compression.
* Add example to readme.

### 0.3.0 / 2019-02-07

* Move library to Beta.

### 0.2.5 / 2018-12-13

* Alias the following KeyManagementServiceClient class methods to instance methods.
  * crypto_key_version_path
  * key_ring_path
  * crypto_key_path_path
  * crypto_key_path
  * location_path

### 0.2.4 / 2018-09-20

* Update documentation.
  * Change documentation URL to googleapis GitHub org.

### 0.2.3 / 2018-09-12

* Add Assymetric Sign/Decrypt.
* Add CryptoKeyVersion template and view classes.
* Add KeyOperationAttestation.

### 0.2.2 / 2018-09-10

* Update documentation.

### 0.2.1 / 2018-08-21

* Update documentation.

### 0.2.0 / 2018-07-09

* Minor rework to how requests are nested.

### 0.1.0 / 2018-07-06

* Initial release
