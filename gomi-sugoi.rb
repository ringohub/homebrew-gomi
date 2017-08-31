require 'formula'

HOMEBREW_GOMI_VERSION='0.1.4'
class Gomi < Formula
    homepage "https://github.com/b4b4r07/gomi"
    if OS.mac?
        if Hardware::CPU.is_64_bit?
            url "https://github.com/b4b4r07/gomi/releases/download/v#{HOMEBREW_GOMI_VERSION}/gomi_darwin_amd64"
            sha256 '3543835615a15d55f4b2899a6f0889ce94d029baebae9ab818d70166e1110fea'
            KIND="amd64"
        else
            url "https://github.com/b4b4r07/gomi/releases/download/v#{HOMEBREW_GOMI_VERSION}/gomi_darwin_386"
            sha256 '5f75c79221e73d5aee7c18a67d51dd39384f378fdf7b3a13445578f9ae16f0d4'
            KIND="386"
        end
    elsif OS.linux?
    end

    version HOMEBREW_GOMI_VERSION
    head 'https://github.com/b4b4r07/gomi.git', :branch => 'master'

    if build.head?
        depends_on 'go' => :build
    end

    def install
        if build.head?
            ENV['GOPATH'] = buildpath
            mkdir_p buildpath/'src/github.com/b4b4r07'
            ln_s buildpath, buildpath/'src/github.com/b4b4r07/gomi'
            system 'go', 'get', 'github.com/jessevdk/go-flags'
            system 'go', 'get', 'github.com/mattn/go-runewidth'
            system 'go', 'get', 'github.com/nsf/termbox-go'
            system 'go', 'get', 'github.com/peco/peco'
            system 'go', 'build', 'cmd/peco/peco.go'
        end
        system 'mv', "gomi_darwin_#{KIND}", 'gomi'
        bin.install 'gomi'
        zsh_completion.install "completions/zsh/_gomi"
    end

    def caveats; <<-EOS.undent
        Welcome to gomi
        EOS
    end
end
