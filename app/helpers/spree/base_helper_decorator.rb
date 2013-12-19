module Spree::BaseHelper
	def breadcrumbs(taxon = nil, product = nil, sep = "&nbsp;&raquo;&nbsp;")
		if String === product
			sep = product
			product = nil
		end

		return "" unless taxon || product || current_page?(products_path)

		session['last_crumb'] = taxon ? taxon.permalink : nil
		sep = content_tag(:span, raw(sep), :id => 'separator')
		crumbs = [content_tag(:li, link_to(t(:home) , root_path) + sep)]

		if taxon
			crumbs << taxon.ancestors.collect { |ancestor| content_tag(:li, link_to(ancestor.name , seo_url(ancestor)) + sep) } unless taxon.ancestors.empty?
			if product
				crumbs << content_tag(:li, link_to(taxon.name , seo_url(taxon)) + sep)
				crumbs << content_tag(:li, content_tag(:span, product.name))
			else
				crumbs << content_tag(:li, content_tag(:span, taxon.name))
			end
		elsif product
			crumbs << content_tag(:li, link_to(t('products') , products_path) + sep)
			crumbs << content_tag(:li, content_tag(:span, product.name))
		else
			crumbs << content_tag(:li, content_tag(:span, t('products')))
		end
		crumb_list = content_tag(:ul, raw(crumbs.flatten.map{|li| li.mb_chars}.join), :class => 'inline')
		content_tag(:div, crumb_list, :id => 'breadcrumbs')
	end

	def last_crumb_path
		plink = session['last_crumb']
		if plink && taxon = Spree::Taxon.find_by_permalink(plink)
			seo_url(taxon)
		else
			products_path
		end
	end
end
