HOMEBREW_GOMI_VERSION = 0.1.7

# Compute sha256 hashes
hash:
		@curl -LOs https://github.com/b4b4r07/gomi/releases/download/v$(HOMEBREW_GOMI_VERSION)/gomi_darwin_amd64
		@curl -LOs https://github.com/b4b4r07/gomi/releases/download/v$(HOMEBREW_GOMI_VERSION)/gomi_darwin_386
		@shasum -a 256 gomi_darwin_amd64 gomi_darwin_386
		@rm gomi_darwin_amd64 gomi_darwin_386
.PHONY: hash
