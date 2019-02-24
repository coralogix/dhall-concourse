let Semver = ../../types/resources/Semver.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "semver"

in  { get_params =
        { bump = None Text, pre = None Text } : Semver.get_params
    , put_params =
          { file = None Text, bump = None Text, pre = None Text }
        : Semver.put_params
    , source =
        { gcs =
              λ(_params : { bucket : Text, key : Text, json_key : Text })
            →   { driver =
                    "gcs"
                , bucket =
                    _params.bucket
                , key =
                    _params.key
                , json_key =
                    _params.json_key
                }
              : Semver.source_gcs
        , git =
              λ(_params : { uri : Text, branch : Text, file : Text })
            →   { driver =
                    "git"
                , uri =
                    _params.uri
                , branch =
                    _params.branch
                , file =
                    _params.file
                , private_key =
                    None Text
                , username =
                    None Text
                , password =
                    None Text
                , git_user =
                    None Text
                , depth =
                    None Natural
                , commit_message =
                    None Text
                }
              : Semver.source_git
        , s3 =
              λ ( _params
                : { bucket :
                      Text
                  , key :
                      Text
                  , access_key_id :
                      Text
                  , secret_access_key :
                      Text
                  }
                )
            →   { driver =
                    "s3"
                , bucket =
                    _params.bucket
                , key =
                    _params.key
                , access_key_id =
                    _params.access_key_id
                , secret_access_key =
                    _params.secret_access_key
                , region_name =
                    None Text
                , endpoint =
                    None Text
                , disable_ssl =
                    None Bool
                , skip_ssl_verification =
                    None Bool
                , server_side_encryption =
                    None Text
                , use_v2_signing =
                    None Bool
                }
              : Semver.source_s3
        , swift =
              λ ( _params
                : { container :
                      Text
                  , item_name :
                      Text
                  , region :
                      Text
                  , identity_endpoint :
                      Text
                  }
                )
            →   { driver =
                    "swift"
                , openstack =
                    { container =
                        _params.container
                    , item_name =
                        _params.item_name
                    , region =
                        _params.region
                    , identity_endpoint =
                        _params.identity_endpoint
                    , username =
                        None Text
                    , user_id =
                        None Text
                    , password =
                        None Text
                    , api_key =
                        None Text
                    , domain_id =
                        None Text
                    , domain_name =
                        None Text
                    , tenant_id =
                        None Text
                    , tenant_name =
                        None Text
                    , allow_reauth =
                        None Bool
                    , token_id =
                        None Text
                    }
                }
              : Semver.source_swift
        }
    , meta =
        { name =
            name
        , resource_type =
              mkResourceType.DockerImage
              { name = name, repository = "cathive/concourse-Semver-resource" }
            : ResourceType
        }
    }
