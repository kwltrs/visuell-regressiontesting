#!/bin/bash -e

WEBSERVER=
WEBBROWSER=

WEBSERVER_IMAGE=httpd:2.4
WEBBROWSER_IMAGE=selenium/standalone-firefox:2.53.1


run_gemini_command() {
  local -r command_and_args="$@"

  trap "_cleanup" INT TERM EXIT

  WEBSERVER=$(docker run --detach \
    --volume $(pwd)/htdocs:/usr/local/apache2/htdocs/:ro,z \
    ${WEBSERVER_IMAGE})

  WEBBROWSER=$(docker run --detach \
    --link ${WEBSERVER}:html-under-test.local \
    -p 4444 \
    ${WEBBROWSER_IMAGE})


  local -r port=$(docker port $WEBBROWSER | sed 's/.*://')

  npm run gemini --silent -- $command_and_args \
                 --grid-url=http://127.0.0.1:$port/wd/hub visual-tests/specs/
}

_cleanup() {
  testRes=$?
  trap - INT TERM EXIT

  docker rm -f ${WEBSERVER} > /dev/null || true
  docker rm -f ${WEBBROWSER} > /dev/null || true

  exit ${testRes}
}



case "$1" in
  "update"*)
    run_gemini_command update
    ;;
  "test"*)
    run_gemini_command test --reporter flat
    ;;
  *)
    echo >&2 "Usage: $0 [test|update]"
    exit 1
    ;;
esac
