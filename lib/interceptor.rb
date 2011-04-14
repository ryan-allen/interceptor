class Interceptor
  VERSION = '0.0.1'

  def initialize(receiver)
    @receiver = receiver
    @interceptions = {}
  end

  def intercept(*targets, &block)
    targets.each { |target| @interceptions[target] = block }
  end

  def method_missing(target, *args, &block)
    if @interceptions[target]
      @interceptions[target].call(@receiver, target, *args, &block)
    else
      @receiver.send(target, *args, &block)
    end
  end
end
