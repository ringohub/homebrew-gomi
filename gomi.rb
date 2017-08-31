require "formula"

class Gomi < Formula
    homepage "https://github.com/b4b4r07/gomi"
    version "0.1.7"
    if Hardware::CPU.is_64_bit?
        url "https://github.com/b4b4r07/gomi/releases/download/v#{version}/gomi_darwin_amd64"
        sha256 'f29424a1e2ecaf860b63a0bef5b9297e251c681928c7682f9c2818c11e46e2f5'
        KIND="amd64"
    else
        url "https://github.com/b4b4r07/gomi/releases/download/v#{version}/gomi_darwin_386"
        sha256 '39e824375ea7ab6dcefba7b671bb1f48c3fe103447c8d2303f3c4ff40993a93c'
        KIND="386"
    end

    def install
        system "mv gomi_darwin_#{KIND} gomi"
        bin.install './gomi'
        system 'curl -L https://raw.githubusercontent.com/b4b4r07/gomi/master/completions/zsh/_gomi >_gomi'
        zsh_completion.install '_gomi'
    end

    test do
        system "#{bin}/gomi", "--help"
    end

    def caveats; msg = <<-'EOS'
                       _
                      (_)
  __ _  ___  _ __ ___  _
 / _` |/ _ \| '_ ` _ \| |
| (_| | (_) | | | | | | |
 \__, |\___/|_| |_| |_|_|
  __/ |
 |___/

  Type `gomi --help' to start

        EOS
    end
end
