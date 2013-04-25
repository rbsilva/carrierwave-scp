# CarrierWave SCP storage

Create the SCP storage alternative to upload files using [CarrierWave](https://github.com/jnicklas/carrierwave/)

## Gem

    gem install carrierwave-scp

## Configuration

First configure CarrierWave with your FTP credentials:

```ruby
CarrierWave.configure do |config|
  storage :scp
  config.scp_host = "remote.host.com"
  config.scp_user = "username"
  config.scp_passwd = "password"
  config.scp_folder = "/public_html/uploads"
end
```
