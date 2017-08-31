require 'formula'

HOMEBREW_GOMI_VERSION='0.1.7'
class Gomi < Formula
    homepage "https://github.com/b4b4r07/gomi"
    if OS.mac?
        if Hardware::CPU.is_64_bit?
            url "https://github.com/b4b4r07/gomi/releases/download/v#{HOMEBREW_GOMI_VERSION}/gomi_darwin_amd64"
            sha256 'f29424a1e2ecaf860b63a0bef5b9297e251c681928c7682f9c2818c11e46e2f5'
            KIND="amd64"
        else
            url "https://github.com/b4b4r07/gomi/releases/download/v#{HOMEBREW_GOMI_VERSION}/gomi_darwin_386"
            sha256 '39e824375ea7ab6dcefba7b671bb1f48c3fe103447c8d2303f3c4ff40993a93c'
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
