let Semver = ../../types/resources/Semver.dhall

let ResourceType = ../../types/ResourceType.dhall

let mkResourceType = ../ResourceType.dhall

let name = "semver"

let repository = "cathive/concourse-Semver-resource"

in  { version =
          λ(_params : { number : Text })
        → { number = _params.number } : Semver.version.schema
    , params =
        { get =
            { bump = None Text, pre = None Text } : Semver.params.get.schema
        , put =
              { file = None Text, bump = None Text, pre = None Text }
            : Semver.params.put.schema
        }
    , source =
        { drivers =
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
                  : Semver.source.drivers.gcs.schema
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
                  : Semver.source.drivers.git.schema
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
                  : Semver.source.drivers.s3.schema
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
                  : Semver.source.drivers.swift.schema
            }
        }
    , meta =
        { name =
            name
        , repository =
            repository
        , resource_type =
            { docker =
                ResourceType.schema.DockerImage
                ( mkResourceType.DockerImage
                  { name = name, repository = repository }
                )
            , registry =
                ResourceType.schema.RegistryImage
                ( mkResourceType.RegistryImage
                  { name = name, repository = repository }
                )
            }
        }
    }
