require "formula"

class Gomi < Formula
    homepage "https://github.com/b4b4r07/gomi"
    version "0.1.5"
    url "https://github.com/b4b4r07/gomi/releases/download/v#{version}/gomi"
    sha256 "dee9566d151f5d947400b9c3aef48eb484c86fea24e019e4f02a2a8525b95e3b"

    def install
        bin.install 'gomi'
        system "curl -L https://raw.githubusercontent.com/b4b4r07/gomi/master/completions/zsh/_gomi >_gomi"
        zsh_completion.install "_gomi"
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
