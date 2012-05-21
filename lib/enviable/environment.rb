require 'forwardable'
class Environment
  class << self
    extend Forwardable

    def internal_conf
      @internal_conf ||= HashWithCaseInsensitiveAccess.new
    end

    def merge!(hash)
      internal_conf.merge!(HashWithCaseInsensitiveAccess.new(hash).to_hash)
      nil
    end

    def clear!
      @internal_conf = HashWithCaseInsensitiveAccess.new
    end

    def method_missing(method, *args, &block)
      super if respond_to? method 

      return internal_conf[method] if internal_conf.has_key? method

      if method =~ /(.*)=$/
        ENV[$1.to_s.upcase] = args.first
      else
        ENV[method.to_s.upcase]
      end
    end

  end
end

class HashWithCaseInsensitiveAccess 
  def initialize(hash = {})
    @proxy = hash.each_pair.with_object({}) do |(k,v), a|
      a[__format_key(k)] = v 
    end
    @original_hash = hash
  end

  def [](key)
    result = @proxy[__format_key(key)]
  end

  def has_key?(key)
    @proxy.has_key?(__format_key(key))
  end

  def to_hash
    @proxy
  end

  def method_missing(method, *args, &block) 
    super if respond_to?(method)
    @proxy.send(method, *args, &block)
  end

  private 

  def __format_key(key)
    key.to_s.downcase.gsub(/\s+/, '_').strip
  end
end
