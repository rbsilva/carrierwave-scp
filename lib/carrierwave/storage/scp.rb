module CarrierWave
  module Storage
    class SCP < Abstract

      def store!(file)
        f = CarrierWave::Storage::SCP::File.new(uploader, self, uploader.store_path)
        f.store(file)
        f
      end

      def retrieve!(identifier)
        CarrierWave::Storage::SCP::File.new(uploader, self, uploader.store_path(identifier))
      end

      class File
        attr_reader :path

        def extension
          path.split('.').last
        end

        def initialize(uploader, base, path)
          @uploader, @base, @path = uploader, base, path
        end

        def read
          file.read
        end

        def size
          file.length
        end

        def store(new_file)
          Net::SCP.upload!(@uploader.scp_host, @uploader.scp_user,
            StringIO.new(new_file.read), "#{@uploader.scp_folder}/#{path}",
            :password => @uploader.scp_passwd, :recursive => true)
        end

      private

        def file
          @file ||= open("scp://#{@uploader.scp_user}:#{@uploader.scp_passwd}@#{@uploader.scp_host}#{@uploader.scp_folder}/#{path}")
        end

      end #end File
    end #end SCP
  end
end
