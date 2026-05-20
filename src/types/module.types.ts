// ═══════════════════════════════════════════════════════════════════
// M06 · Type definitions
// ═══════════════════════════════════════════════════════════════════

export type SectionId =
  | 'opening'
  | 'thinkaloud'
  | 'frameworks'
  | 'break'
  | 'ai'
  | 'methods'
  | 'personal'
  | 'closing';

export interface SectionMeta {
  id:          SectionId;
  number:      number;
  path:        string;
  shortHe:     string;
  titleHe:     string;
  subtitleHe:  string;
  minutes:     number;
}

/** The 3 metacognitive methods the workshop teaches */
export type TechniqueKey = 'kwl' | 'thinkaloud' | 'exit';

/** Age tier for the teacher's own class (used in Break section) */
export type AgeTier = 'elementary' | 'middle' | 'high';

export interface CustomTopic {
  subject:  string;
  grade:    string;
  ageTier:  AgeTier;
  topic:    string;
  context?: string;
}

export interface SectionProgress {
  visited:     boolean;
  completed:   boolean;
  completedAt: number | null;
}

export interface ModuleProgress {
  sections:           Record<SectionId, SectionProgress>;
  customTopic:        CustomTopic | null;
  personalTechnique:  TechniqueKey | null;
}