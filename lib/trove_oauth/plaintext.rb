module OAuth::Signature
 class PLAINTEXT2 < Base
   implements 'PLAINTEXT'

   def signature_base_string
     secret + "&"
   end
 end
end