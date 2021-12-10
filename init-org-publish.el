(require 'ox-publish)
(setq org-publish-project-alist
      '(

        ;; ... add all the components here (see below)...
        ("org-notes"
         :base-directory "~/projects/sites/dennisthenomad/www/"
         :base-extension "org"
         :publishing-directory "~/projects/sites/dennisthenomad/public/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         )
        ("org-static"
         :base-directory "~/projects/sites/dennisthenomad/www/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/projects/sites/dennisthenomad/public/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))
        ))
