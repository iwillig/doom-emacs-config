(after! org (setq org-tags-column -78))

(setq shortcut-link-regex
  "^https://app[^.]*\\.\\(clubhouse\\.io\\|shortcut\\.com\\)/[^/]+/\\(story\\|epic\\)/\\([0-9]+\\)")

(defun tc/org-insert-link (url description)
  (insert "[[" url "][" description "]]"))

(defun org-insert-shortcut-link (url)
  (interactive (list (let ((url (current-kill 0 t)))
                       (if (string-match shortcut-link-regex url)
                           url
                         (read-string "Shortcut URL: ")))))
  (when (null (string-match shortcut-link-regex url))
    (error "Invalid Shortcut URL '%s'" url))
  (let ((shortcut-id (match-string 3 url)))
    (tc/org-insert-link url (concat "sc-" shortcut-id))))
