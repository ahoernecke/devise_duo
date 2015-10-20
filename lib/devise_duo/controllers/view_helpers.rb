module DeviseDuo
  module Views
    module Helpers

      def duo_request_sms_link
        link_to(
          I18n.t('request_sms', {:scope => 'devise'}),
          url_for([resource_name, :request_sms]),
          :id => "duo-request-sms-link",
          :method => :post,
          :remote => true
        )
      end

      def verify_duo_form(&block)
        form_tag([resource_name, :verify_duo], :id => 'devise_duo', :class => 'duo-form', :method => :post) do
          buffer = hidden_field_tag(:"#{resource_name}_id", @resource.id)
          buffer << capture(&block)
        end
      end

      def enable_duo_form(&block)
        form_tag([resource_name, :enable_duo], :class => 'duo-form', :method => :post) do
          capture(&block)
        end
      end

      def verify_duo_installation_form(&block)
        form_tag([resource_name, :verify_duo_installation], :class => 'duo-form', :method => :post) do
          capture(&block)
        end
      end
    end
  end
end

