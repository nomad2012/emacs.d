(setq org-static-blog-publish-title "Dennis the Nomad's Blog")
(setq org-static-blog-publish-url "https://blog.dennisthenomad.com/")
(setq org-static-blog-publish-directory "/home/dennis/projects/sites/dennisthenomad/blog/")
(setq org-static-blog-posts-directory "/home/dennis/projects/sites/dennisthenomad/blog/posts/")
(setq org-static-blog-drafts-directory "/home/dennis/projects/sites/dennisthenomad/blog/drafts/")
(setq org-static-blog-enable-tags t)
(setq org-export-with-toc nil)
(setq org-export-with-section-numbers nil)

;; This header is inserted into the <head> section of every page:
;;   (you will need to create the style sheet at
;;    ~/projects/blog/static/style.css
;;    and the favicon at
;;    ~/projects/blog/static/favicon.ico)
(setq org-static-blog-page-header
"<meta name=\"author\" content=\"Dennis Draheim\">
<meta name=\"referrer\" content=\"no-referrer\">
<link href=\"static/simple.min.css\" rel=\"stylesheet\" type=\"text/css\" />
<link rel=\"icon\" href=\"static/favicon.ico\">")

;; This preamble is inserted at the beginning of the <body> of every page:
;;   This particular HTML creates a <div> with a simple linked headline
(setq org-static-blog-page-preamble
"<div class=\"header\">
  <a href=\"https://blog.dennisthenomad.com/\">Blog Home</a>
</div>")

;; This postamble is inserted at the end of the <body> of every page:
;;   This particular HTML creates a <div> with a link to the archive page
;;   and a licensing stub.
(setq org-static-blog-page-postamble
"<center><a rel=\"license\" href=\"https://creativecommons.org/licenses/by-sa/3.0/\"><img alt=\"Creative Commons License\" style=\"border-width:0\" src=\"https://i.creativecommons.org/l/by-sa/3.0/88x31.png\" /></a><br /><span xmlns:dct=\"https://purl.org/dc/terms/\" href=\"https://purl.org/dc/dcmitype/Text\" property=\"dct:title\" rel=\"dct:type\">dennisthenomad.com</span> by <a xmlns:cc=\"https://creativecommons.org/ns#\" href=\"https://dennisthenomad.com\" property=\"cc:attributionName\" rel=\"cc:attributionURL\">Dennis Draheim</a> is licensed under a <a rel=\"license\" href=\"https://creativecommons.org/licenses/by-sa/3.0/\">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.</center>"

      ;; This HTML code is inserted into the index page between the preamble and
      ;;   the blog posts
)

(setq org-static-blog-index-front-matter
      "<h1> Recent Blog Posts </h1>\n")
