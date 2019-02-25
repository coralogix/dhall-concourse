let GCS = { driver : Text, bucket : Text, key : Text, json_key : Text } : Type

let Git =
        { driver :
            Text
        , uri :
            Text
        , branch :
            Text
        , file :
            Text
        , private_key :
            Optional Text
        , username :
            Optional Text
        , password :
            Optional Text
        , git_user :
            Optional Text
        , depth :
            Optional Natural
        , commit_message :
            Optional Text
        }
      : Type

let S3 =
        { driver :
            Text
        , bucket :
            Text
        , key :
            Text
        , access_key_id :
            Text
        , secret_access_key :
            Text
        , region_name :
            Optional Text
        , endpoint :
            Optional Text
        , disable_ssl :
            Optional Bool
        , skip_ssl_verification :
            Optional Bool
        , server_side_encryption :
            Optional Text
        , use_v2_signing :
            Optional Bool
        }
      : Type

let Swift =
        { driver :
            Text
        , openstack :
            { container :
                Text
            , item_name :
                Text
            , region :
                Text
            , identity_endpoint :
                Text
            , username :
                Optional Text
            , user_id :
                Optional Text
            , password :
                Optional Text
            , api_key :
                Optional Text
            , domain_id :
                Optional Text
            , domain_name :
                Optional Text
            , tenant_id :
                Optional Text
            , tenant_name :
                Optional Text
            , allow_reauth :
                Optional Bool
            , token_id :
                Optional Text
            }
        }
      : Type

in  { version =
        { schema = { number : Text } : Type }
    , params =
        { get =
            { schema = { bump : Optional Text, pre : Optional Text } : Type }
        , put =
            { schema =
                  { file :
                      Optional Text
                  , bump :
                      Optional Text
                  , pre :
                      Optional Text
                  }
                : Type
            }
        }
    , source =
        { schema =
            < GCS : GCS | Git : Git | S3 : S3 | Swift : Swift > : Type
        , drivers =
            { gcs =
                { schema = GCS : Type }
            , git =
                { schema = Git : Type }
            , s3 =
                { schema = S3 : Type }
            , swift =
                { schema = Swift : Type }
            }
        }
    }
