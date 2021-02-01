;;; repeep.el --- Repeat some action with some sleep  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  ROCKTAKEY

;; Author: ROCKTAKEY <rocktakey@gmail.com>
;; Keywords: tools, convenience

;; Version: 0.0.0
;; Package-Requires: ((emacs "24.1"))
;; URL: https://github.com/ROCKTAKEY/
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(defgroup repeep ()
  "Group for repeep."
  :group 'tools
  :prefix "repeep")

(defcustom repeep-default-interval 1
  "Second for which Emacs sleep each action in `repeep'."
  :group 'repeep
  :type 'number)

(defun repeep (&optional interval function)
  "Repeat action run before with sleep.
Emacs sleep for INTERVAL seconds.
FUNCTION is used as action instead of `repeat'."
  (interactive
   (list (if current-prefix-arg
             (read-number "Repeat interval(sec): " repeep-default-interval)
           repeep-default-interval)))
  (while (not quit-flag)
    (let ((inhibit-quit t)
          (current-prefix-arg nil))
      (call-interactively (or function last-repeatable-command)))
    (sit-for interval)))


(provide 'repeep)
;;; repeep.el ends here
