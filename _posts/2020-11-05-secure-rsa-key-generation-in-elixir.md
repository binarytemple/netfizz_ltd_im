---
layout: post
categories:
- elixir
- rsa
- security
date: 05/11/2020 10:37 AM +0000
title: Secure RSA key generation in Elixir

---
```elixir
defmodule RsaGeneratorTest do
  use ExUnit.Case

  defp do_generate do

    # http://erlang.org/doc/apps/public_key/public_key_records.html#rsa

    {:RSAPrivateKey, _version, modulus, publicExponent, _privateExponent, _prime1, _prime2,
     _exponent1, _exponent2, _coefficient,
     _otherPrimeInfos} = rsa_private_key = :public_key.generate_key({:rsa, 2048, 65537})

    rsa_public_key = {:RSAPublicKey, modulus, publicExponent}

    rsa_private_key_pem_entry = :public_key.pem_entry_encode(:RSAPrivateKey, rsa_private_key)
    rsa_public_key_pem_entry = :public_key.pem_entry_encode(:RSAPublicKey, rsa_public_key)

    pem_out_public = :public_key.pem_encode([rsa_public_key_pem_entry])
    pem_out_private = :public_key.pem_encode([rsa_private_key_pem_entry])

    {pem_out_private,pem_out_public}
end

```

```elixir

  @doc """
  This works (generating pem files using openssl)
  """
  test "openssl generate/verify RSA key pair" do
    System.cmd("openssl", ~w(genrsa -out /tmp/openssl.private.pem 2048), stderr_to_stdout: true)

    {out, ret} =
      System.cmd("openssl", ~w(rsa -in /tmp/openssl.private.pem -check), stderr_to_stdout: true)

    assert out =~ <<"writing RSA key\nRSA key ok\n">>
    assert ret == 0

  end
```

```elixir
  @doc """
    This fails (generating pem files using erlang :public_key module)
  """
  test "erl generate/verify RSA key pair" do
    # http://erlang.org/doc/apps/public_key/public_key_records.html#rsa

    { pem_out_private,  pem_out_public } = do_generate()

    File.rm("/tmp/private.pem")
    File.rm("/tmp/public.pem")

    File.write("/tmp/private.pem", pem_out_private)
    File.write("/tmp/public.pem", pem_out_public)

    {out, ret} =
      System.cmd("openssl", ~w(rsa -in /tmp/private.pem -check), stderr_to_stdout: true)

    assert out =~ <<"writing RSA key\nRSA key ok\n">>
    assert ret == 0
    assert true == true
  end
end
```