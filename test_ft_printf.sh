make -s -C ..
cc -Wall -Wextra -Werror -D FT test_ft_printf.c -I.. -L.. -lftprintf -o ft_printf
cc -Wall -Wextra -Werror test_ft_printf.c -o libc_printf
./ft_printf > ft_printf.txt
./libc_printf > libc_printf.txt
paste <(echo ft_printf.txt; echo ---; cat ft_printf.txt) <(echo libc_printf.txt; echo ---; cat libc_printf.txt) | column -t -s$'\t' -o$'\t'
diff ft_printf.txt libc_printf.txt
if [ $? -eq 0 ]; then
	cat <<'EOF'


       ::::::::  :::    ::: 
     :+:    :+: :+:   :+:   
    +:+    +:+ +:+  +:+     
   +#+    +:+ +#++:++       
  +#+    +#+ +#+  +#+       
 #+#    #+# #+#   #+#       
 ########  ###    ###       

EOF
else
	exit 1
fi
