class Latex2arxiv < Formula
  include Language::Python::Virtualenv

  desc "ArXiv submission pipeline — CLI, CI, and AI"
  homepage "https://github.com/YuZh98/latex2arxiv"
  url "https://files.pythonhosted.org/packages/35/00/b6caa15534ed3983d44a24ffedd38e41186d413f064dedbd1ace7bf89244/latex2arxiv-0.11.0.tar.gz"
  sha256 "ddf1a9bbe5fdeaa8fb1d278cfa50c11576967e070f422181c5d8b5db73dfc043"
  license "MIT"

  depends_on "pkg-config" => :build
  depends_on "freetype"
  depends_on "jpeg-turbo"
  depends_on "libtiff"
  depends_on "libyaml"
  depends_on "little-cms2"
  depends_on "openjpeg"
  depends_on "python@3.13"
  depends_on "webp"

  resource "bibtexparser" do
    url "https://files.pythonhosted.org/packages/44/1c/577d3ce406e88f370e80a6ebf76ae52a2866521e0b585e8ec612759894f1/bibtexparser-1.4.4.tar.gz"
    sha256 "093b6c824f7a71d3a748867c4057b71f77c55b8dbc07efc993b781771520d8fb"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/8c/21/c2bcdd5906101a30244eaffc1b6e6ce71a31bd0742a01eb89e660ebfac2d/pillow-12.2.0.tar.gz"
    sha256 "a830b1a40919539d07806aa58e1b114df53ddd43213d9c8b75847eee6c0182b5"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/f3/91/9c6ee907786a473bf81c5f53cf703ba0957b23ab84c264080fb5a450416f/pyparsing-3.3.2.tar.gz"
    sha256 "c777f4d763f140633dcb6d8a3eda953bf7a214dc4eff598413c070bcdc117cbc"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Summary:", shell_output("#{bin}/latex2arxiv --demo --dry-run")
  end
end
