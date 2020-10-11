{ meta =
  { name = "kops"
  , repository = "quay.io/coralogix/eng-concourse-resource-kops"
  }
, Version = { Type = { status : Text }, default = {=} }
, Params =
  { Get = { Type = {}, default = {=} }, Put = { Type = {}, default = {=} } }
, Source =
    let Source =
          { Type =
              { aws_access_key_id : Text
              , aws_access_secret_key : Text
              , cluster : Text
              , state_bucket : Text
              }
          , default = {=}
          }

    let test =
          Source::{
          , aws_access_key_id = "AWS Access Key ID"
          , aws_access_secret_key = "AWS Access Secret Key"
          , cluster = "mycluster.k8s.cluster.local"
          , state_bucket = "s3://my-state-bucket"
          }

    in  Source
}
