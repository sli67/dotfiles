(require 'ox-publish)

;(setq  org-html-preamble-format '(("en" "<h1>hello sli</h1>")))
(setq sli-biosoft-header
      (concat "<div id=\"header\">"
       "<h1>Stefan Litsche</h1>"
       "<ul>"
           "<li><a href=\"/\">Home</a></li>"
           "<li><a href=\"/blog/\">Blog</a></li>"
           "<li><a href=\"/projects/\">Projects</a></li>"
           "<li><a href=\"/contact.html\">Contact</a></li>"
           "<li><a href=\"/resume.html\">Resume</a></li>"
       "</ul>"
       "</div>"))

(setq org-publish-project-alist
      `(

        ;; ... add allthe components here (see below)...
        ("org-notes"
         :base-directory "~/work/git/biosoft/src/"
         :base-extension "org"
         :publishing-directory "~/work/git/biosoft/html/"
         :html-head-include-default-style nil
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/style.css\">"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble nil
         :html-preamble ,sli-biosoft-header
         ;:html-preamble-format  "<h1>hello sli</h1>" ;(("en" "<h1>hello sli</h1>"))
         :with-toc nil
         )

        ("org-static"
        :base-directory "~/work/git/biosoft/src/"
        :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
        :publishing-directory "~/work/git/biosoft/html/"
        :recursive t
        :publishing-function org-publish-attachment
        )

        ("biosoft" :components ("org-notes" "org-static"))))

(setq org-html-html5-fancy t)
