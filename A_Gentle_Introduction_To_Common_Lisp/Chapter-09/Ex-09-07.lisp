(defun cookie-monster ()
  "Asks the user for a cookie until he gets one"
  (format t "Give me cookie!!!~&Cookie? ")
  (let ((answer (read)))
    (cond ((equal answer 'cookie) (format t "Thank you! munch munch... BURP"))
          (t (cookie-monster)))))
