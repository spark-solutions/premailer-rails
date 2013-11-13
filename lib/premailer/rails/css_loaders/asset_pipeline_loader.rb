class Premailer
  module Rails
    module CSSLoaders
      module AssetPipelineLoader
        extend self

        def load(path)
          if asset_pipeline_present?
            file = file_name(path)
            asset = ::Rails.application.assets.find_asset(file)
            asset.to_s if asset
          end
        end

        def asset_pipeline_present?
          defined?(::Rails) and ::Rails.application.respond_to?(:assets)
        end

        def file_name(path)
          path
            .sub("#{::Rails.configuration.assets.prefix}/", '')
            .sub(/-\h{32}\.css$/, '.css')
        end
      end
    end
  end
end