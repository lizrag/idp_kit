terraform{
    backend "s3" {
      bucket= var.bucket_name
      key= var.bucket_key
      region= var.region
      encrypt = true
      use_lockfile = true 
    }
}