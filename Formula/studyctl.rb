class Studyctl < Formula
  include Language::Python::Virtualenv

  desc "AuDHD-aware study tool with AI Socratic mentoring and spaced repetition"
  homepage "https://github.com/NetDevAutomate/socratic-study-mentor"
  url "https://files.pythonhosted.org/packages/a2/7f/86405f2e1da3d47502076a24115133d3df41b9d57c15583b8e1b867dc1dc/studyctl-2.0.0.tar.gz"
  sha256 "6267108ea195a0b51bac332d106ba991527256931752c7ba342ea94225a3a980"
  license "MIT"

  depends_on "python@3.12"

  # Core dependencies: click, rich, pyyaml
  # Run `brew update-python-resources Formula/studyctl.rb` to regenerate
  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d0c3e70"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/a1/53/830aa4c3066a8ab0ae9a9955976fb770f9f4f38c919e5f27684b2006bc91/rich-13.9.4.tar.gz"
    sha256 "439594978a49a09530cff7ebc4b5c7103ef57c16d0d5a40462f11b9a4787df43"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07571/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aauj3c8ec7bb"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/7c/2d/c3338d48ea6cc0feb8446d8e6937e1408088a72a39937982cc6111d17f84/pygments-2.19.1.tar.gz"
    sha256 "61c16d2a8576dc0649d9f39e089b5f02bcd27fba10d8fb4dcc28173f7a45151f"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      studyctl is installed! Get started:
        studyctl setup

      Optional system dependencies for full functionality:
        brew install pandoc          # Obsidian markdown to PDF conversion
        npm install -g @mermaid-js/mermaid-cli  # Mermaid diagram rendering

      Optional Python extras (install via pip in the virtualenv):
        pip install 'studyctl[web]'        # FastAPI web UI
        pip install 'studyctl[tui]'        # Terminal dashboard
        pip install 'studyctl[content]'    # PDF splitting (pymupdf)
        pip install 'studyctl[mcp]'        # MCP agent integration
        pip install 'studyctl[all]'        # Everything

      MCP server for AI assistants:
        claude mcp add studyctl-mcp
    EOS
  end

  test do
    assert_match "version", shell_output("#{bin}/studyctl --version")
    assert_match "Usage:", shell_output("#{bin}/studyctl --help")
  end
end
