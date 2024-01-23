window.Mathjax = {
	section: 0,
	loader: {
		load: [
			'[tex]/ams',
			'[tex]/physics'
		]
	},
	tex: {
		macros: {
			C: "\\mathbb{C}",
			G: "\\mathcal{G}",
			N: "\\mathbb{N}",
			R: "\\mathbb{R}",
			Z: "\\mathbb{Z}",
			1: "\\mathbb{1}",
		},
		packages: {
			'[+]': [
				'ams',
				'physics',
				'sections'
			],
		},
		physics: {
			italicdiff: true
		},
		tags: 'ams',
		tagformat: {
			number: (n) => MathJax.config.section + '.' + n,
			id: (tag) => 'eqn-id:' + tag
		}
	},
	startup: {
		ready() {
			const Configuration = MathJax._.input.tex.Configuration.Configuration;
			const CommandMap = MathJax._.input.tex.SymbolMap.CommandMap;
			new CommandMap('sections', {
				nextSection: 'NextSection'
			}, {
			NextSection(parser, name) {
				MathJax.config.section++;
				parser.tags.counter = parser.tags.allCounter = 0;
			}
			});
			Configuration.create(
				'sections', {handler: {macro: ['sections']}}
			);
			MathJax.startup.defaultReady();
		}
	}
}