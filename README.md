# CIG Homebrew Tools

A Homebrew tap to install CIG internal tools

<!-- Make sure `HOMEBREW_GITHUB_API_TOKEN` is exported to your environment. 

Then: -->

```
brew tap itcig/tools
  
brew install itcig/tools/cig-sdk
```


## Update package

1. Update version number in URL

2. Download tarball from release and get new checksum

```
shasum -a 256 ~/Downloads/cig-sdk-0.1.1.tar.gz | awk $1 '{print $1}'
```

3. Update forumla values:

- `url`
- `sha256` 
- version number in test


## Testing 

```
brew install --build-from-source cig-sdk
```
