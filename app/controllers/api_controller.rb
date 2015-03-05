class ApiController < ApplicationController
  private
  def get_cpu_temperature
    cpu_temp = (`vcgencmd measure_temp` || 'not supported')  # XXX - vcgencmd requires the user to be in 'video' group
    if cpu_temp =~ /temp=(.*)/
      cpu_temp = $1
    end
    cpu_temp
  end
  def get_memory_split
    mem_split = `vcgencmd get_mem arm && vcgencmd get_mem gpu`  # XXX - vcgencmd requires the user to be in 'video' group
  end

  public
  # GET /hostname.json
  def hostname
    hostname = (`hostname` || 'not supported')

    respond_to do |format|
      format.json {
        render json: {
          hostname: hostname,
        }
      }
    end
  end
  # GET /uname.json
  def uname
    uname = (`uname -a` || 'not supported')

    respond_to do |format|
      format.json {
        render json: {
          uname: uname,
        }
      }
    end
  end
  # GET /uptime.json
  def uptime
    uptime = (`uptime` || 'not supported')

    respond_to do |format|
      format.json {
        render json: {
          uptime: uptime,
        }
      }
    end
  end
  # GET /free_spaces.json
  def free_spaces
    free_spaces = (`df -h` || 'not supported')

    respond_to do |format|
      format.json {
        render json: {
          free_spaces: free_spaces,
        }
      }
    end
  end
  # GET /memory_split.json
  def memory_split
    respond_to do |format|
      format.json {
        render json: {
          memory_split: get_memory_split,
        }
      }
    end
  end
  # GET /free_memory.json
  def free_memory
    free_memory = (`free -o -h` || 'not supported')

    respond_to do |format|
      format.json {
        render json: {
          free_memory: free_memory,
        }
      }
    end
  end
  # GET /cpu_temperature.json
  def cpu_temperature
    respond_to do |format|
      format.json {
        render json: {
          cpu_temperature: get_cpu_temperature,
        }
      }
    end
  end
  # GET /cpu_info.json
  def cpu_info
    cpu_info = (`cat /proc/cpuinfo` || 'not supported')

    respond_to do |format|
      format.json {
        render json: {
          cpu_info: cpu_info,
        }
      }
    end
  end
end
