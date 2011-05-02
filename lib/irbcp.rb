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
      raise 'fail!' # TODO !
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
