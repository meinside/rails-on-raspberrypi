class HomeController < ApplicationController
  private
  def cpu_temperature
    cpu_temp = (`vcgencmd measure_temp` || 'not supported').strip  # XXX - vcgencmd requires the user to be in 'video' group
    if cpu_temp =~ /temp=(.*)/
      cpu_temp = $1
    end
    cpu_temp
  end
  def memory_splits
    mem_splits = `vcgencmd get_mem arm && vcgencmd get_mem gpu`  # XXX - vcgencmd requires the user to be in 'video' group
  end

  public
  def index
    @uname = `uname -a`
    @uptime = `uptime`
    @df = `df -h`
    @mem_splits = memory_splits
    @free = `free -o -h`
    @cpu_temp = cpu_temperature
    @cpu_info = `cat /proc/cpuinfo`
  end
end
