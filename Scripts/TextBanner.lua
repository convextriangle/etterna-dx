function TextBannerAfterSet(self, param)
	local Title = self:GetChild("Title");
	local Subtitle = self:GetChild("Subtitle");
	local Artist = self:GetChild("Artist");

	Title:maxwidth(248):zoomx(.85):settext(Title:GetText());

	Subtitle:visible(false);
	Artist:visible(false);

	--self:stoptweening();
end
