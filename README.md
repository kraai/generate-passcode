I wanted to generate a secure passcode for my iPhone; I also wanted to
learn a little more about
[Guile](https://www.gnu.org/software/guile/).  This program is the
result.  If you have suggestions as to how I can improve it, please
let me know.  I'm new to Guile, so I'm pretty sure I'm doing it wrong.

# Usage

1. Install [Guile](https://www.gnu.org/software/guile/) and
   [guile-gcrypt](https://notabug.org/cwebber/guile-gcrypt).
2. Run `generate-passcode.scm`.  If you pass it an argument (e.g.,
   `generate-passcode.scm 4`), it will generate a passcode of that
   length instead of the default length (i.e., 6).

# License

Copyright 2021 Matthew James Kraai

This file is part of generate-passcode.

generate-passcode is free software: you can redistribute it and/or
modify it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

generate-passcode is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public
License along with generate-passcode.  If not, see
<https://www.gnu.org/licenses/>.
