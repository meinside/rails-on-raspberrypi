class HomeController < ApplicationController
  TEMPERATURE_FILE = '/sys/class/thermal/thermal_zone0/temp'

  private
  def cpu_temperature
    cpu_temp = 0.0
    File.open(TEMPERATURE_FILE, 'r'){|file|
      cpu_temp = file.read.strip.to_f / 1000.0
    }
  rescue
    puts $!
  ensure
    return cpu_temp
  end

  public
  def index
    @uname = `uname -a`
    @uptime = `uptime`
    @df = `df -h`
    @free = `free`
    @cpu_temp = cpu_temperature
    @cpu_info = `cat /proc/cpuinfo`
  end
end
