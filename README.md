# Atlas_search_tests
Search Tests op de HELE elastic dataset. Search Regressie vangnet

Nieuwe 'zoek features' gedragen zich vaak anders op de hele dataset.
Ook het toevoegen van nieuwe datasets kan bestaande zoek resultaten
vervuilen.

Het project bevat twee soorten tests: 

1. Tests gebaseerd op [pyresttest](https://github.com/svanoort/pyresttest)
2. Tests gebaseerd op een [Google Sheet](https://docs.google.com/spreadsheets/d/15i_rXplhsZhQIXwPmxKX2O54s9InrUupFAuD-hU03g4), ook bekend als de "Rob tests". 


## Install

- mkvirtualenv search_test
- pip install -r requirements.txt

## Runtests

    resttest.py https://acc.api.data.amsterdam.nl smoke_test.yml
    
## Specific test for atlas client created by rob m and rob k.

To test against acceptance we need JWKS keysest for acceptance.
Find authz_keyset_acc in ansible vault and set in the PUB_JWKS env var
(without {% raw %} like :

    export PUB_JWKS='
    {
                "keys": [
                    {
                        "kty": "EC",
                        "key_ops": [
                            "verify",
                            "sign"
                        ],
                        "kid": "2aedafba-8170-4064-b704-ce92b7c89cc6",
                        "crv": "P-256",
                        "x": "6r8PYwqfZbq_QzoMA4tzJJsYUIIXdeyPA27qTgEJCDw=",
                        "y": "Cf2clfAfFuuCB06NMfIat9ultkMyrMQO9Hd2H7O9ZVE=",
                        "d": "N1vu0UQUp0vLfaNeM0EDbl4quvvL6m_ltjoAXXzkI3U="
                    }
                ]
            }
    '

The you can run :

    python robs_tests.py https://acc.api.data.amsterdam.nl


## Docker environment

Include the OAuth credentials in the `docker-compose.yml` file:

* `OIDC_CLIENT_ID`
* `OIDC_CLIENT_SECRET`
* `OIDC_TOKEN_ENDPOINT`

Either run the test directly or use the run script. Directly run test using:

    docker-compose build
    docker-compose run smoketest resttest.py https://acc.api.data.amsterdam.nl smoke_test.yml 

Use the run script as follows:

	URL=https://acc.api.data.amsterdam.nl ./run_tests.sh
