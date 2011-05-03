require 'systemu'

module Irbcp
  Version = '0.0.1'

  def Irbcp.version() Irbcp::Version end


  case RUBY_PLATFORM
    when /darwin/
      Copy = 'pbcopy'
      Paste = 'pbpaste'

    when /linux/
      Copy = 'xsel –clipboard –input'
      Paste = 'xsel –clipboard –output'

    when /windoze/
      #  Windows Server 2003 , Windows Vista , Windows 7. Anything else don t have and don t matter anymore :)
      Copy = 'clip.exe'
      # download paste.exe from http://www.c3scripts.com/tutorials/msdos/paste.html#exe
      Paste = 'paste.exe'
  end

  def copy(*args)
    stdin = args.join
    systemu(Copy, :stdin => stdin)
    stdin
  end

  def paste(*args)
    stdout = '' 
    systemu(Paste, :stdout => stdout)
    stdout
  end

  def cp(*args)
    args.size==0 ? paste(*args) : copy(*args)
  end

  extend(self)
end

IrbCp = Irbcp

module Kernel
private
  %w( copy paste cp ).each do |method|
    module_eval <<-__
      def #{ method }(*args, &block)
        Irbcp.#{ method }(*args, &block)
      end
    __
  end
end
