##!/bin/sh

cd AppDocTest

xcrun xcodebuild docbuild \
    -scheme AppDocTest \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/AppDocTest.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "verbose-parakeet" # add your repo name later

echo '<script>window.location.href += "/documentation/appdoctest"</script>' > .docs/index.html




