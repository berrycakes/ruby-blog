module ApplicationHelper
    def custom_javascript_packs
        begin 
            "#{javascript_pack_tag params[:controller]}/#{params[:action]}", 'data-turbolinks-track': 'reload'
        rescue Webpacker::Manifest::MissingEntryError
        end
    end
end
