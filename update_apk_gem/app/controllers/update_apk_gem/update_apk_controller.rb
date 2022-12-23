require_dependency "update_apk_gem/application_controller"

module UpdateApkGem
  class UpdateApkController < ApplicationController

    def get_apk_version

      # apk_file_name like "update_5_.apk", the number between '_' is the version
      version = apk_file_name.split('_')[1].to_i
      raise 'version number should exist' if version == 0

      Rails.logger.debug "If you see me it means you are on my gem hehe"
  
      respond_to do |format|
        format.json { render json: {version: version}, status: 200 }
      end
    end
  
    def get_new_apk
      send_file(apk_full_path, filename: 'update.apk')
    end
  
    # this folder should contain only the apk file
    @@apk_path = "#{Rails.root}/apk/"
  
    def apk_full_path
      Dir["#{@@apk_path}*"][0]
    end
  
    def apk_file_name
      File.basename apk_full_path
    end

  end
end
