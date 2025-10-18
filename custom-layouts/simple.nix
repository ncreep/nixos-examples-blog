{
  services.xserver.xkb.extraLayouts = {
    test = {
      description = "Test";
      languages = ["eng"];
      symbolsFile3 = ./test.xkb;
    };
  };
}
