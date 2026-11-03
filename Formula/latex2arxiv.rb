class Latex2arxiv < Formula
  include Language::Python::Virtualenv

  desc "ArXiv submission pipeline — CLI, CI, and AI"
  homepage "https://github.com/YuZh98/latex2arxiv"
  url "https://files.pythonhosted.org/packages/2f/fb/75bef735bb80c7e847c8ac261621b0d085949f1efdd998200d25e785e2c3/latex2arxiv-1.3.3.tar.gz"
  sha256 "bdffde66b688c44e7c679cb8a3b1974c8a7698debc2e50820f1660bc9b879249"
  license "MIT"

  depends_on "libyaml"
  depends_on "pillow"
  depends_on "python@3.14"

  resource "bibtexparser" do
    url "https://files.pythonhosted.org/packages/44/1c/577d3ce406e88f370e80a6ebf76ae52a2866521e0b585e8ec612759894f1/bibtexparser-1.4.4.tar.gz"
    sha256 "093b6c824f7a71d3a748867c4057b71f77c55b8dbc07efc993b781771520d8fb"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/f3/91/9c6ee907786a473bf81c5f53cf703ba0957b23ab84c264080fb5a450416f/pyparsing-3.3.2.tar.gz"
    sha256 "c777f4d763f140633dcb6d8a3eda953bf7a214dc4eff598413c070bcdc117cbc"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "regex" do
    url "https://files.pythonhosted.org/packages/fc/f2/af1da9d3ceed77bfcdce40427d49ba0be94e4fe84245e3bfef68c10e75b6/regex-2026.9.29.tar.gz"
    sha256 "8b5fcc4771732191b2b7d1dd68d8f0353f47f8d90b6150f6dce58bf1112442cb"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system libexec/"bin/python", "-c", "import PIL, regex, yaml, bibtexparser"
    assert_match "Summary:", shell_output("#{bin}/latex2arxiv --demo --dry-run")
  end
end
