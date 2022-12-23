UpdateApkGem::Engine.routes.draw do
    resources :update_apk, only: [] do
        collection do
            get :get_apk_version
            get :get_new_apk
        end
    end
end
