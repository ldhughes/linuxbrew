require "formula"

class GoAppEngine64 < Formula
  homepage "http://code.google.com/appengine/docs/go/overview.html"

  if OS.mac?
    url "https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_darwin_amd64-1.9.13.zip"
    sha1 "00aa4f6f3099cd364eb38b89548d2297bdc41350"
  elsif OS.linux?
    url "https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.13.zip"
    sha1 "aa67ac85debc1ea9e332ac7382850e81c385cc63"
  else
    raise "Unknown operating system"
  end

  def install
    cd ".."
    share.install "go_appengine" => name
    %w[
      api_server.py appcfg.py bulkloader.py bulkload_client.py dev_appserver.py download_appstats.py goapp
    ].each do |fn|
      bin.install_symlink share/name/fn
    end
  end
end
